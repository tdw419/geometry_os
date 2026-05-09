; DESCRIPTION: Renders a yellow box of size 82x60 starting at (410, 113).
; PLAN: r0=410(x), r1=113(y), r2=82(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 113
LDI r2, 82
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
