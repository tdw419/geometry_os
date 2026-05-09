; DESCRIPTION: Places a cyan 28x70 rectangle at position (251, 169).
; PLAN: r0=251(x), r1=169(y), r2=28(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 169
LDI r2, 28
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
