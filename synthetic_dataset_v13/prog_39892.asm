; DESCRIPTION: Places a white circle of radius 57 at center (215, 146).
; PLAN: r0=215(x), r1=146(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
