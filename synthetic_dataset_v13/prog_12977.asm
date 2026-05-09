; DESCRIPTION: Composite: Draws a cyan rectangle at (353, 164) with width 79 and height 38 then Sets a single black pixel at (403, 250).
; PLAN: r0=353(x), r1=164(y), r2=79(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 164
LDI r2, 79
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
HALT
