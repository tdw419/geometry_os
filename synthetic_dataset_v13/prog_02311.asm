; DESCRIPTION: Composite: Places a magenta 114x20 rectangle at position (349, 209) then Draws a cyan line from (307, 168) to (97, 128).
; PLAN: r0=349(x), r1=209(y), r2=114(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=168(y1), r7=97(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 209
LDI r2, 114
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 168
LDI r7, 97
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
