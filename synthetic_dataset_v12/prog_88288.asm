; DESCRIPTION: Renders a cyan box of size 79x120 starting at (101, 51).
; PLAN: r0=101(x), r1=51(y), r2=79(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 51
LDI r2, 79
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
