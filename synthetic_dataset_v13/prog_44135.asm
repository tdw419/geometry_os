; DESCRIPTION: Renders a yellow box of size 98x103 starting at (403, 117).
; PLAN: r0=403(x), r1=117(y), r2=98(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 117
LDI r2, 98
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
