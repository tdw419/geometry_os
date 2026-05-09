; DESCRIPTION: Composite: Draws a cyan line from (361, 92) to (38, 153) then Places a green 50x26 rectangle at position (213, 71).
; PLAN: r0=361(x1), r1=92(y1), r2=38(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=71(y), r7=50(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 92
LDI r2, 38
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 71
LDI r7, 50
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
