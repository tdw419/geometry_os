; DESCRIPTION: Composite: Sets a single red pixel at (271, 103) then Renders a cyan box of size 81x28 starting at (122, 182) then Renders a green line between points (382, 84) and (384, 184).
; PLAN: r0=271(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=182(y), r7=81(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x1), r11=84(y1), r12=384(x2), r13=184(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 103
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 182
LDI r7, 81
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 84
LDI r12, 384
LDI r13, 184
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
