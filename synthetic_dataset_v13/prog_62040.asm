; DESCRIPTION: Renders a green box of size 21x48 starting at (305, 8).
; PLAN: r0=305(x), r1=8(y), r2=21(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 8
LDI r2, 21
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
