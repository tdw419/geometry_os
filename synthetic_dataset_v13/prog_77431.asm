; DESCRIPTION: Places a green 57x40 rectangle at position (169, 171).
; PLAN: r0=169(x), r1=171(y), r2=57(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 171
LDI r2, 57
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
