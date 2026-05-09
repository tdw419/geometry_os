; DESCRIPTION: Places a orange 116x48 rectangle at position (393, 195).
; PLAN: r0=393(x), r1=195(y), r2=116(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 195
LDI r2, 116
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
