; DESCRIPTION: Composite: Places a red line segment connecting (507, 164) to (488, 81) then Sets a single black pixel at (235, 191) then Renders a red box of size 76x77 starting at (21, 29).
; PLAN: r0=507(x1), r1=164(y1), r2=488(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=191(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=21(x), r11=29(y), r12=76(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 164
LDI r2, 488
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 191
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 21
LDI r11, 29
LDI r12, 76
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
