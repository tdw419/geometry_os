; DESCRIPTION: Places a cyan 55x79 rectangle at position (152, 10).
; PLAN: r0=152(x), r1=10(y), r2=55(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 10
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
