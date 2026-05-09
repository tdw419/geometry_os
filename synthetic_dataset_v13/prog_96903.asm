; DESCRIPTION: Composite: Sets a single orange pixel at (30, 243) then Creates a blue rectangular region at (383, 59) spanning 32 by 32 pixels.
; PLAN: r0=30(x), r1=243(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=59(y), r7=32(width), r8=32(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 243
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 383
LDI r6, 59
LDI r7, 32
LDI r8, 32
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
