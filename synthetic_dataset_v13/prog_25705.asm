; DESCRIPTION: Composite: Renders a cyan box of size 119x50 starting at (305, 28) then Sets a single purple pixel at (503, 218).
; PLAN: r0=305(x), r1=28(y), r2=119(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 28
LDI r2, 119
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
