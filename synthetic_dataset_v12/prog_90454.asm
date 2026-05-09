; DESCRIPTION: Composite: Sets a single orange pixel at (158, 171) then Renders a magenta disk with center (167, 92) and radius 74 then Draws a cyan line from (503, 118) to (384, 111).
; PLAN: r0=158(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=92(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x1), r11=118(y1), r12=384(x2), r13=111(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 167
LDI r6, 92
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 118
LDI r12, 384
LDI r13, 111
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
