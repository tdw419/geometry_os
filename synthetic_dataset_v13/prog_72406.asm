; DESCRIPTION: Renders a yellow box of size 95x59 starting at (403, 178).
; PLAN: r0=403(x), r1=178(y), r2=95(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 178
LDI r2, 95
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
