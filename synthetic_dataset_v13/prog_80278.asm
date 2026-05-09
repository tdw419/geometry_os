; DESCRIPTION: Renders a cyan box of size 86x70 starting at (293, 175).
; PLAN: r0=293(x), r1=175(y), r2=86(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 175
LDI r2, 86
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
