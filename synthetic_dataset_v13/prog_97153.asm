; DESCRIPTION: Places a white 10x109 rectangle at position (173, 56).
; PLAN: r0=173(x), r1=56(y), r2=10(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 56
LDI r2, 10
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
