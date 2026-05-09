; DESCRIPTION: Composite: Sets a single orange pixel at (480, 187) then Renders a yellow box of size 79x45 starting at (288, 82).
; PLAN: r0=480(x), r1=187(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=82(y), r7=79(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 187
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 288
LDI r6, 82
LDI r7, 79
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
