; DESCRIPTION: Composite: Draws a black line from (350, 37) to (95, 213) then Renders a cyan disk with center (310, 197) and radius 39.
; PLAN: r0=350(x1), r1=37(y1), r2=95(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=197(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 37
LDI r2, 95
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 197
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
