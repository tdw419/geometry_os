; DESCRIPTION: Renders a cyan box of size 79x87 starting at (356, 161).
; PLAN: r0=356(x), r1=161(y), r2=79(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 161
LDI r2, 79
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
