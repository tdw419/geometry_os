; DESCRIPTION: Composite: Renders a white box of size 79x16 starting at (186, 95) then Sets a single cyan pixel at (383, 162).
; PLAN: r0=186(x), r1=95(y), r2=79(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=162(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 95
LDI r2, 79
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 162
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
