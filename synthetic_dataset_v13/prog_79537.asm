; DESCRIPTION: Composite: Renders a blue disk with center (410, 178) and radius 57 then Renders a purple box of size 55x44 starting at (180, 92).
; PLAN: r0=410(x), r1=178(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=92(y), r7=55(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 178
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 92
LDI r7, 55
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
