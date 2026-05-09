; DESCRIPTION: Places a orange 28x27 rectangle at position (174, 48).
; PLAN: r0=174(x), r1=48(y), r2=28(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 48
LDI r2, 28
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
