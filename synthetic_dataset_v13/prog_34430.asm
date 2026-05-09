; DESCRIPTION: Composite: Draws a yellow line from (358, 47) to (400, 237) then Places a white 62x64 rectangle at position (41, 169).
; PLAN: r0=358(x1), r1=47(y1), r2=400(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=169(y), r7=62(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 47
LDI r2, 400
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 169
LDI r7, 62
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
