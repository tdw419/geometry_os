; DESCRIPTION: Composite: Places a blue dot at position (502, 215) then Draws a red rectangle at (75, 77) with width 86 and height 73 then Draws a cyan circle centered at (67, 92) with radius 51.
; PLAN: r0=502(x), r1=215(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=77(y), r7=86(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=92(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 502
LDI r1, 215
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 77
LDI r7, 86
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 92
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
