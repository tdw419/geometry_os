; DESCRIPTION: Places a green 38x71 rectangle at position (243, 59).
; PLAN: r0=243(x), r1=59(y), r2=38(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 59
LDI r2, 38
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
