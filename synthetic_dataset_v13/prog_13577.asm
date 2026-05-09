; DESCRIPTION: Renders a cyan box of size 96x38 starting at (293, 185).
; PLAN: r0=293(x), r1=185(y), r2=96(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 185
LDI r2, 96
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
