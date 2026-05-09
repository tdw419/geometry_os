; DESCRIPTION: Renders a yellow box of size 12x65 starting at (480, 171).
; PLAN: r0=480(x), r1=171(y), r2=12(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 171
LDI r2, 12
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
