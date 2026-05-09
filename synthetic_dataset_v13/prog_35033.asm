; DESCRIPTION: Composite: Renders a red line between points (61, 7) and (205, 213) then Renders a cyan disk with center (252, 177) and radius 74 then Places a blue 78x50 rectangle at position (211, 182).
; PLAN: r0=61(x1), r1=7(y1), r2=205(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=177(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x), r11=182(y), r12=78(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 7
LDI r2, 205
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 177
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 182
LDI r12, 78
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
