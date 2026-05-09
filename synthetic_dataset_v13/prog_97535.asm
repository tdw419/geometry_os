; DESCRIPTION: Renders a cyan box of size 110x46 starting at (293, 164).
; PLAN: r0=293(x), r1=164(y), r2=110(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 164
LDI r2, 110
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
