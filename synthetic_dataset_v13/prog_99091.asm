; DESCRIPTION: Composite: Draws a white line from (494, 168) to (509, 213) then Places a magenta 36x108 rectangle at position (280, 127).
; PLAN: r0=494(x1), r1=168(y1), r2=509(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=127(y), r7=36(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 168
LDI r2, 509
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 127
LDI r7, 36
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
