; DESCRIPTION: Places a green 37x47 rectangle at position (243, 124).
; PLAN: r0=243(x), r1=124(y), r2=37(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 124
LDI r2, 37
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
