; DESCRIPTION: Places a blue 33x44 rectangle at position (243, 30).
; PLAN: r0=243(x), r1=30(y), r2=33(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 30
LDI r2, 33
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
