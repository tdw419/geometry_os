; DESCRIPTION: Places a orange circle of radius 42 at center (284, 133).
; PLAN: r0=284(x), r1=133(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 133
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
