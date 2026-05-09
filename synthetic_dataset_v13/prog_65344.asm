; DESCRIPTION: Places a orange 48x116 rectangle at position (346, 103).
; PLAN: r0=346(x), r1=103(y), r2=48(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 103
LDI r2, 48
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
