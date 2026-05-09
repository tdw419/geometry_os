; DESCRIPTION: Renders a yellow box of size 59x59 starting at (445, 164).
; PLAN: r0=445(x), r1=164(y), r2=59(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 164
LDI r2, 59
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
