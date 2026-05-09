; DESCRIPTION: Places a red circle of radius 42 at center (333, 146).
; PLAN: r0=333(x), r1=146(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 146
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
