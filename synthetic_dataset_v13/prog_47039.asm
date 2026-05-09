; DESCRIPTION: Renders a yellow box of size 113x60 starting at (69, 174).
; PLAN: r0=69(x), r1=174(y), r2=113(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 174
LDI r2, 113
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
