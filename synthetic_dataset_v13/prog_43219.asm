; DESCRIPTION: Places a green 36x68 rectangle at position (103, 107).
; PLAN: r0=103(x), r1=107(y), r2=36(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 107
LDI r2, 36
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
