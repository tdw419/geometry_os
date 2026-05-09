; DESCRIPTION: Composite: Renders a red box of size 29x46 starting at (295, 192) then Places a blue dot at position (356, 57).
; PLAN: r0=295(x), r1=192(y), r2=29(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=57(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 192
LDI r2, 29
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 57
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
