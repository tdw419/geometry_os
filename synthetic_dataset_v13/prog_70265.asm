; DESCRIPTION: Composite: Places a cyan 26x36 rectangle at position (263, 123) then Draws a blue line from (415, 41) to (401, 42) then Places a green dot at position (365, 180).
; PLAN: r0=263(x), r1=123(y), r2=26(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=41(y1), r7=401(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=180(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 123
LDI r2, 26
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 41
LDI r7, 401
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 180
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
