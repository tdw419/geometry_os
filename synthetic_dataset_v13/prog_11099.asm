; DESCRIPTION: Renders a cyan box of size 11x79 starting at (187, 142).
; PLAN: r0=187(x), r1=142(y), r2=11(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 142
LDI r2, 11
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
