; DESCRIPTION: Renders a cyan box of size 59x110 starting at (262, 94).
; PLAN: r0=262(x), r1=94(y), r2=59(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 94
LDI r2, 59
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
