; DESCRIPTION: Composite: Renders a red box of size 70x22 starting at (114, 33) then Places a cyan dot at position (65, 33).
; PLAN: r0=114(x), r1=33(y), r2=70(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=33(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 33
LDI r2, 70
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 33
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
