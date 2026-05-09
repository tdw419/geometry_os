; DESCRIPTION: Places a white 99x63 rectangle at position (408, 103).
; PLAN: r0=408(x), r1=103(y), r2=99(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 103
LDI r2, 99
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
