; DESCRIPTION: Renders a black box of size 47x54 starting at (403, 59).
; PLAN: r0=403(x), r1=59(y), r2=47(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 59
LDI r2, 47
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
