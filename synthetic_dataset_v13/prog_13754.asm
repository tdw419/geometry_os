; DESCRIPTION: Renders a cyan box of size 64x15 starting at (317, 218).
; PLAN: r0=317(x), r1=218(y), r2=64(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 218
LDI r2, 64
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
