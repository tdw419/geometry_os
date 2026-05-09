; DESCRIPTION: Places a orange 30x79 rectangle at position (242, 96).
; PLAN: r0=242(x), r1=96(y), r2=30(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 96
LDI r2, 30
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
