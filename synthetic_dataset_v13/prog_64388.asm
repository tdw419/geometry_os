; DESCRIPTION: Composite: Places a black dot at position (434, 254) then Places a orange line segment connecting (16, 32) to (480, 193).
; PLAN: r0=434(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=32(y1), r7=480(x2), r8=193(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 16
LDI r6, 32
LDI r7, 480
LDI r8, 193
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
