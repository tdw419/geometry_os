; DESCRIPTION: Composite: Renders a white box of size 64x90 starting at (189, 43) then Places a blue line segment connecting (92, 236) to (202, 143).
; PLAN: r0=189(x), r1=43(y), r2=64(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=236(y1), r7=202(x2), r8=143(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 43
LDI r2, 64
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 236
LDI r7, 202
LDI r8, 143
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
