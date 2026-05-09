; DESCRIPTION: Composite: Places a blue dot at position (88, 76) then Renders a red box of size 28x45 starting at (372, 86).
; PLAN: r0=88(x), r1=76(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=86(y), r7=28(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 76
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 86
LDI r7, 28
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
