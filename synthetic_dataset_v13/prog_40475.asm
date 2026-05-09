; DESCRIPTION: Composite: Draws a green line from (401, 4) to (294, 14) then Places a blue 71x49 rectangle at position (6, 7).
; PLAN: r0=401(x1), r1=4(y1), r2=294(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=7(y), r7=71(width), r8=49(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 4
LDI r2, 294
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 7
LDI r7, 71
LDI r8, 49
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
