; DESCRIPTION: Places a green 103x69 rectangle at position (288, 112).
; PLAN: r0=288(x), r1=112(y), r2=103(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 112
LDI r2, 103
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
