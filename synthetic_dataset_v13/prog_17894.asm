; DESCRIPTION: Places a green 65x67 rectangle at position (113, 124).
; PLAN: r0=113(x), r1=124(y), r2=65(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 124
LDI r2, 65
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
