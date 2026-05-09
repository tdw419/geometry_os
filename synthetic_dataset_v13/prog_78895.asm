; DESCRIPTION: Places a green 46x120 rectangle at position (313, 124).
; PLAN: r0=313(x), r1=124(y), r2=46(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 124
LDI r2, 46
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
